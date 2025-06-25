
grok_validation_enabled = true

custom_parsing_rules = {
  "parse-status-check" = {
    name          = "Parse New Relic Status Logs"
    attribute     = "message"
    enabled      = false
    grok          = "monitorName=%%{DATA:monitorName} region=%%{WORD:region} message=.*?(?<fetchedUrl>https://\\S+)?"
    lucene        = "newrelic.source:api.logs"
    nrql          = "SELECT * FROM Log WHERE newrelic.source = 'api.logs'"
    test_log_lines = ["monitorName: New Relic Status Check region: US message: https://status.newrelic.com"]
  },
  "new-relic-test" = {
    name          = "New Relic Test Log Parsing Rule"
    attribute     = "message"
    enabled      = true
    grok          = "%%{IP:host_ip}"
    lucene        = "logtype:linux_messages"
    nrql          = "SELECT * FROM Log WHERE logtype = 'linux_messages'"
    test_log_lines = ["host_ip: 43.3.120.2"]
  }
}
