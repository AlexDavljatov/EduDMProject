
<%@ page import="edu.dm.course.Course" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-course" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="course.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courseInstance, field: "name")}</td>
				
			</tr>
		
%{--
			<tr class="prop">
				<td valign="top" class="name"><g:message code="course.components.label" default="Components" /></td>

				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${courseInstance.components}" var="c">
						<li><g:link controller="component" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>

			</tr>
--}%
        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.materials.label" default="Materials" /></td>
            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${courseInstance.materials}" var="c">
                        <li><g:link controller="material" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="course.quizes.label" default="Quizes" /></td>
            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${courseInstance.quizes}" var="c">
                        <li><g:link controller="quiz" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>
        </tr>


        <tr class="prop">
            <td valign="top" style="text-align: left;" class="value">
                <g:form controller="user" action="enrollCourse">
                    <input type="hidden" name="course_id" value="${fieldValue(bean: courseInstance, field: "id")}"/>
                    <div class="form-actions margin-top-medium">
                        <g:submitButton name="create" class="btn btn-primary"
                                        value="${message(code: 'default.button.enroll.label', default: 'Enroll!')}"/>

                    </div>
                </g:form>
            </td>

        </tr>


        </tbody>
	</table>
</section>

</body>

</html>
