---
to: src/main/java/jp/co/nisshinsci/saas/framework/service/<%= h.inflection.camelize(name, false) %>Service.java
---
package jp.co.nisshinsci.saas.framework.service;

import java.util.List;

import com.google.common.collect.Lists;
import io.github.thunderz99.cosmos.condition.Condition;
import io.github.thunderz99.cosmos.util.JsonUtil;
import jp.co.nisshinsci.saas.framework.dto.<%= h.inflection.camelize(name, false) %>;
import jp.co.nisshinsci.saas.framework.service.base.BaseAuditableDataCRUDService;
import jp.co.nisshinsci.saas.framework.service.base.FuzzySearchableService;
import jp.co.nisshinsci.saas.framework.service.base.InitializableService;

/**
 * <%= h.inflection.camelize(name, false) %>Service
 *
 * @author gong.hanjin
 */
public class <%= h.inflection.camelize(name, false) %>Service extends BaseAuditableDataCRUDService<<%= h.inflection.camelize(name, false) %>> implements InitializableService<<%= h.inflection.camelize(name, false) %>>, FuzzySearchableService {
    public static final <%= h.inflection.camelize(name, false) %>Service singleton = new <%= h.inflection.camelize(name, false) %>Service();

    public <%= h.inflection.camelize(name, false) %>Service() {
        super(<%= h.inflection.camelize(name, false) %>.class);
    }

    @Override
    public int getDefaultLimit() {
        return 100;
    }
}
