---
inject: true
to: src/main/java/jp/co/nisshinsci/saas/framework/Routes.java
after: ThemeApi\.singleton\.delete
skip_if: app\.post\("/api/<%= name.toLowerCase() %>s",
---
<%=console.log()%>
        // **  Site <%= h.inflection.camelize(name, false) %> API */
        app.post("/api/<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.create(ctx)));
        app.get("/api/<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.find(ctx)));
        app.put("/api/<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>/:id", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.upsert(ctx)));
        app.get("/api/<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>/:id", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.read(ctx)));
        app.delete("/api/<%= name.endsWith('s') ? name.toLowerCase():(name.toLowerCase()+'s') %>/:id", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.delete(ctx)));
