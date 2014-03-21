<%@ page import="edu.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="item.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${itemInstance?.name}"/>

</div>

