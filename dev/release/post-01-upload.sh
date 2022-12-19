#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -eu

main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <version> <rc-num>"
        exit 1
    fi
    local -r version="$1"
    local -r rc_number="$2"
    local -r tag="apache-arrow-adbc-${version}-rc${rc_number}"

    rc_id="apache-arrow-adbc-${version}-rc${rc_number}"
    release_id="apache-arrow-adbc-${version}"
    echo "Copying dev/ to release/"
    svn \
        cp \
        -m "Apache Arrow ADBC ${version}" \
        https://dist.apache.org/repos/dist/dev/arrow/${rc_id} \
        https://dist.apache.org/repos/dist/release/arrow/${release_id}

    echo "Create final tag"
    git tag -a "apache-arrow-adbc-${version}" -m "ADBC Libraries ${version}" "${tag}^{}"

    echo "Success! The release is available here:"
    echo "  https://dist.apache.org/repos/dist/release/arrow/${release_id}"
    echo "Please push the tag apache-arrow-adbc-${version}!"
}

main "$@"
