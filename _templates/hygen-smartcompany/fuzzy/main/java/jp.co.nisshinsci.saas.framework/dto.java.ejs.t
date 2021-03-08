---
to: src/main/java/jp/co/nisshinsci/saas/framework/dto/<%= h.inflection.camelize(name, false) %>.java
---
package jp.co.nisshinsci.saas.framework.dto;

import java.util.List;
import java.util.Map;

import jp.co.nisshinsci.saas.framework.dto.base.AuditableData;
import jp.co.nisshinsci.saas.framework.dto.base.FuzzySearchable;
import jp.co.nisshinsci.saas.framework.util.TextUtil;
import com.google.common.collect.Lists;

/**
 * <%= h.inflection.camelize(name, false) %> Dto
 *
 * @author gong.hanjin
 */
public class <%= h.inflection.camelize(name, false) %> extends AuditableData implements FuzzySearchable {

<%-dtoCode.dto %>

    @Override
    public String generateFieldForSearch(String host) throws Exception {
        StringBuilder sb = new StringBuilder();
        sb<%-dtoCode.generateFieldForSearch %>
        return TextUtil.normalize(sb.toString().trim());
    }
}
