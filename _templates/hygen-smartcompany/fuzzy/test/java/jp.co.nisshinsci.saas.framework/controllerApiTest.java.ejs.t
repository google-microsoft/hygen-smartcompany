---
to: src/test/java/jp/co/nisshinsci/saas/framework/controller/<%= h.inflection.camelize(name, false) %>ApiTest.java
---
package jp.co.nisshinsci.saas.framework.controller;

import java.util.HashMap;
import java.util.Map;

import com.google.common.collect.Maps;
import io.github.thunderz99.cosmos.util.JsonUtil;
import io.restassured.http.Cookie;
import jp.co.nisshinsci.saas.framework.Routes;
import jp.co.nisshinsci.saas.framework.constant.Errors;
import jp.co.nisshinsci.saas.framework.controller.base.BaseApiTest;
import jp.co.nisshinsci.saas.framework.dto.QuestionnaireEvent;
import jp.co.nisshinsci.saas.framework.dto.<%= h.inflection.camelize(name, false) %>;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static jp.co.nisshinsci.saas.framework.controller.base.BaseApi.X_CSRF_TOKEN;
import static org.assertj.core.api.Assertions.assertThat;

class <%= h.inflection.camelize(name, false) %>ApiTest extends BaseApiTest {

    protected Class<<%= h.inflection.camelize(name, false) %>> getDataClass() {
        return <%= h.inflection.camelize(name, false) %>.class;
    }

    protected String getApiPath() {
        return "/api/<%= name.toLowerCase() %>s/";
    }

    protected Cookie getAccountCookie4Test() {
        return admin1Cookie;
    }

    protected String getAccountCsrfToken4Test() {
        return admin1CsrfToken;
    }

}
