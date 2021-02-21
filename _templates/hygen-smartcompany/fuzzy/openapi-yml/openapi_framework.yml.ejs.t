---
inject: true
to: openapi/framework.yml
after: \-\ name\:\ theme
skip_if: \-\ name\:\ <%= name.toLowerCase() %>
---
  - name: <%= name.toLowerCase() %>
