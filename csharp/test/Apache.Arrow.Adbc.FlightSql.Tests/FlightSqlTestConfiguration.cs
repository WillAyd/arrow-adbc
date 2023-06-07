﻿/*
* Licensed to the Apache Software Foundation (ASF) under one or more
* contributor license agreements.  See the NOTICE file distributed with
* this work for additional information regarding copyright ownership.
* The ASF licenses this file to You under the Apache License, Version 2.0
* (the "License"); you may not use this file except in compliance with
* the License.  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

using System.Text.Json.Serialization;

namespace Apache.Arrow.Adbc.FlightSql.Tests
{
    internal class FlightSqlTestConfiguration
    {
        [JsonPropertyName("serverAddress")]
        public string ServerAddress { get; set; }

        [JsonPropertyName("routing_tag"), JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public string RoutingTag { get; set; }

        [JsonPropertyName("routing_queue"), JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public string RoutingQueue { get; set; }

        [JsonPropertyName("authorization")]
        public string Authorization { get; set; }

        [JsonPropertyName("query")]
        public string Query { get; set; }

        [JsonPropertyName("expectedResults")]
        public long ExpectedResultsCount { get; set; }
    }
}
