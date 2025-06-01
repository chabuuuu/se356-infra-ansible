GET access token for kibana:

```bash
curl -X POST -u elastic:<YOUR_PASSWORD> "localhost:9200/_security/service/elastic/kibana/credential/token/token1?pretty"
```

And then set the access token to .env: ELASTICSEARCH_SERVICEACCOUNTTOKEN
