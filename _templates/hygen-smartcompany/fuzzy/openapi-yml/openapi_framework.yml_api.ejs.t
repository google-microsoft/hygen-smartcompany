---
inject: true
to: openapi/framework.yml
before: \/themes
skip_if: \/<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>
---

  /<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>:
    post:
      summary: create a <%= name.toLowerCase() %>
      operationId: post-<%= name.toLowerCase() %>
      requestBody:
        description: create a <%= name.toLowerCase() %>。新規作成の時は、idを空白にしてください。
        required: true
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/<%=h.inflection.camelize(name, false) %>"
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/<%=h.inflection.camelize(name, false) %>"
        "401":
          description: authentication error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "403":
          description: permission error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "404":
          description: not found error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"

        "500":
          description: other error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
      description: Create a new <%= name.toLowerCase() %>
      tags:
        - <%= name.toLowerCase() %>
    get:
      summary: get <%= h.inflection.camelize(name, false) %> list
      operationId: get-<%= h.inflection.camelize(name, false) %>-list
      parameters:
        - in: query
          name: filter
          schema:
            type: string
          description: <%= h.inflection.camelize(name, false) %> 検索条件
          example: { "q": "<%= name.toLowerCase() %>" }
        - in: query
          name: range
          schema:
            type: string
          description: offsetとlimitを設定する。主にpaging用。formatは[$start, $end]。デフォルトは[0-100]。startは0から始まる、endは含まない。例：1ページ20個、2ページ目は[20, 40]
          example: "[0,20]"
        - in: query
          name: sort
          schema:
            type: string
          description: ソート順のjson string。デフォルトは'["createdAt", "ASC"]'（作成日の昇順）
          example: '["id", "ASC"]'
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: "#/components/schemas/<%= h.inflection.camelize(name, false) %>"
        "401":
          description: authentication error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "403":
          description: permission error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "500":
          description: other error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
      description: get <%= h.inflection.camelize(name, false) %> list
      tags:
        - <%= name.toLowerCase() %>
  /<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>/{id}:
    put:
      summary: update <%= name.toLowerCase() %>
      operationId: put-<%= name.toLowerCase() %>
      parameters:
        - in: path
          name: id
          schema:
            type: string
          required: true
          description: ID
      requestBody:
        description: update <%= name.toLowerCase() %>。
        required: true
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/<%= h.inflection.camelize(name, false) %>"
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/<%= h.inflection.camelize(name, false) %>"
        "401":
          description: authentication error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "403":
          description: permission error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "500":
          description: other error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
      description: update <%= name.toLowerCase() %>
      tags:
        - <%= name.toLowerCase() %>
    get:
      summary: get <%= name.toLowerCase() %> by Id
      operationId: get-<%= name.toLowerCase() %>
      parameters:
        - in: path
          name: id
          schema:
            type: string
          required: true
          description: ID
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/<%= h.inflection.camelize(name, false) %>"
        "401":
          description: authentication error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "403":
          description: permission error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"

        "500":
          description: other error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
      description: get <%= name.toLowerCase() %> detail by Id
      tags:
        - <%= name.toLowerCase() %>
    delete:
      summary: delete <%= name.toLowerCase() %> by Id
      operationId: delete-<%= name.toLowerCase() %>
      parameters:
        - in: path
          name: id
          schema:
            type: string
          required: true
          description: ID

      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/DeletedObject"
        "401":
          description: authentication error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "403":
          description: permission error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
        "500":
          description: other error
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/Error"
      description: delete <%= name.toLowerCase() %> by Id
      tags:
        -<%= name.toLowerCase() %>
