---
to: src/main/java/jp/co/nisshinsci/saas/framework/controller/<%= h.inflection.camelize(name, false) %>Api.java
---
package jp.co.nisshinsci.saas.framework.controller;

import java.util.Map;
import java.util.Set;

import io.github.thunderz99.cosmos.util.JsonUtil;
import io.javalin.http.Context;
import jp.co.nisshinsci.saas.framework.controller.base.BaseAuditableDataCRUDApi;
import jp.co.nisshinsci.saas.framework.dto.*;
import jp.co.nisshinsci.saas.framework.dto.permission.feature.Features;
import jp.co.nisshinsci.saas.framework.service.QuestionFormService;
import jp.co.nisshinsci.saas.framework.service.QuestionnaireEventService;
import jp.co.nisshinsci.saas.framework.service.<%= h.inflection.camelize(name, false) %>Service;

/**
 * <%= h.inflection.camelize(name, false) %>Api
 *
 * @author gong.hanjin
 */
public class <%= h.inflection.camelize(name, false) %>Api extends BaseAuditableDataCRUDApi<<%= h.inflection.camelize(name, false) %>, <%= h.inflection.camelize(name, false) %>Service> {
    public static final <%= h.inflection.camelize(name, false) %>Api singleton = new <%= h.inflection.camelize(name, false) %>Api();

    private <%= h.inflection.camelize(name, false) %>Api() {
    }

    @Override
    protected Class<<%= h.inflection.camelize(name, false) %>> getDataClass() {
        return <%= h.inflection.camelize(name, false) %>.class;
    }

    @Override
    protected <%= h.inflection.camelize(name, false) %>Service getService() {
        return <%= h.inflection.camelize(name, false) %>Service.singleton;
    }

}
