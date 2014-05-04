
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
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="course.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courseInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="course.categories.label" default="Categories" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courseInstance, field: "categories")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="course.author.label" default="Author" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${courseInstance?.author?.id}">${courseInstance?.author?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="course.lectures.label" default="Lectures" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${courseInstance.lectures}" var="l">
						<li><g:link controller="lecture" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>

        <tr class="prop">
            <g:form controller="user" action="finalScore">
                <input type="hidden" name="course_id" value="${fieldValue(bean: courseInstance, field: "id")}"/>
                <td valign="top" class="name"><g:message code="quiz.solution.label" default="Final Score"/></td>
                <td>
                    <div class="form-actions margin-top-medium">
                        <g:submitButton name="compute" class="btn btn-primary"
                                        value="${message(code: 'default.button.enroll.label', default: 'Compute final score')}"/>

                    </div>
                </td>
            </g:form>

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
        <tr class="prop">
            <td valign="top" style="text-align: left;" class="value">
                <g:form controller="course" action="clusterize">
                    <input type="hidden" name="course_id" value="${fieldValue(bean: courseInstance, field: "id")}"/>
                    <div class="form-actions margin-top-medium">
                        <g:submitButton name="create" class="btn btn-primary"
                                        value="${message(code: 'default.button.enroll.label', default: 'Get clusters')}"/>

                    </div>
                </g:form>
            </td>

        </tr>
        </tbody>
	</table>
</section>

</body>

</html>
