---
inject: true
to: src/main/java/jp/co/nisshinsci/saas/framework/Routes.java
after: app.delete("/api/themes/:id", ctx -> ctx.json(ThemeApi.singleton.delete(ctx)));
skip_if: app.post("/api/<%= name.toLowerCase() %>s",
---
        // **  Site <%= h.inflection.camelize(name, false) %> API */
        app.post("/api/<%= name.toLowerCase() %>s", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.create(ctx)));
        app.put("/api/<%= name.toLowerCase() %>s/:id", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.upsert(ctx)));
        app.get("/api/<%= name.toLowerCase() %>s/:id", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.read(ctx)));
        app.delete("/api/<%= name.toLowerCase() %>s/:id", ctx -> ctx.json(<%= h.inflection.camelize(name, false) %>Api.singleton.delete(ctx)));
