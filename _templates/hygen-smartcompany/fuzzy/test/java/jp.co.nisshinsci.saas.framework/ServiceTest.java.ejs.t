---
to: src/test/java/jp/co/nisshinsci/saas/framework/service/<%= h.inflection.camelize(name, false) %>ServiceTest.java
---
package jp.co.nisshinsci.saas.framework.service;

import io.github.thunderz99.cosmos.condition.Condition;
import jp.co.nisshinsci.saas.framework.controller.base.BaseTest;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class <%= h.inflection.camelize(name, false) %>ServiceTest extends BaseTest {
    <%= h.inflection.camelize(name, false) %>Service service = <%= h.inflection.camelize(name, false) %>Service.singleton;

    @Test
    void find_should_do_fuzzy_search() throws Exception {
        var item = service.find(host, Condition.filter("q", "査"));
        assertThat(item).isNotEmpty();
    }
}
