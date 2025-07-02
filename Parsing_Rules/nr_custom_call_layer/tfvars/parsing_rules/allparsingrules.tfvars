
custom_parsing_rules = {
  "parse-status-check" = {
    name          = "Docker Auth Health Check Parser"
    attribute     = "message"
    enabled       = false
    grok          = "%%{DATA:status_message}: %%{DATA:endpoint}"
    lucene        = "newrelic.source:api.logs"
    nrql          = "SELECT * FROM Log WHERE newrelic.source = 'api.logs' AND filePath LIKE '%936d4c3fa72f531827f50f2f7e9e9337dc7211f0bd7f8eb79693cad10b3653c5%'"
    test_log_lines = ["Not Found: /auth/health"]
  }
  # "new-relic-test" = {
  #   name          = "New Relic Test Log Parsing Rule"
  #   attribute     = "message"
  #   enabled      = true
  #   grok          = "%%{IP:host_ip}"
  #   lucene        = "logtype:linux_messages"

  #   nrql          = "SELECT * FROM Log WHERE logtype = 'linux_messages'"
    
  # },
  # "Wrong-Pattern" = {
  #     name          = "Baigan"
  #     attribute     = "message"
  #     enabled       = true
  #     grok          = "monitorName=%%{DATA:monitorName} region=%%{WORD:region} message=.*?(?<fetchedUrl>https://\\S+)?"
  #     lucene        = "newrelic.source:api.logs"
  #     nrql          = "SELECT * FROM Log WHERE newrelic.source = 'api.logs'"
  #     test_log_lines = ["this log definitely won't match the grok pattern"]  # ❌ Wrong test log
  #   }
  }

