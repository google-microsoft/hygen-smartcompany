---
inject: true
to: openapi/framework.yml
before: \ \ \ \ Theme
skip_if:  \ \ \ \ <%=h.inflection.camelize(name, false) %>
---
    <%= h.inflection.camelize(name, false) %>:
      description: site <%= name.toLowerCase() %>
      x-tags:
        - <%= name.toLowerCase() %>
      type: object
      properties:<%-dtoYml.dtoCompent %>
        id:
          type: string
        createdBy:
          type: string
        createdByName:
          type: string
        createdAt:
          type: string
        updatedBy:
          type: string
        updatedByName:
          type: string
        updatedAt:
          type: string
        permittedOps:
          $ref: "#/components/schemas/PermittedOperations"
      example:
        <%-dtoYml.example %>