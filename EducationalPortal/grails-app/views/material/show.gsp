
<%@ page import="edu.dm.course.component.material.Material"%>
<!DOCTYPE html>
<html style = "video, input {
    display: block;
}

input {
    width: 100%;       
}

.info {
    background-color: aqua;            
}

.error {
    background-color: red;
    color: white;
}">

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'material.label', default: 'Material')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>

<script type="text/javascript">
	(function localFileVideoPlayerInit(win) {
		var URL = win.URL || win.webkitURL, displayMessage = (function displayMessageInit() {
			var node = document.querySelector('#message');

			return function displayMessage(message, isError) {
				node.innerHTML = message;
				node.className = isError ? 'error' : 'info';
			};
		}()), playSelectedFile = function playSelectedFileInit(event) {
			var file = this.files[0];

			var type = file.type;

			var videoNode = document.querySelector('video');

			var canPlay = videoNode.canPlayType(type);

			canPlay = (canPlay === '' ? 'no' : canPlay);

			var message = 'Can play type "' + type + '": ' + canPlay;

			var isError = canPlay === 'no';

			displayMessage(message, isError);

			if (isError) {
				return;
			}

			var fileURL = URL.createObjectURL(file);

			videoNode.src = fileURL;
		}, inputNode = document.querySelector('input');

		if (!URL) {
			displayMessage('Your browser is not '
					+ '<a href="http://caniuse.com/bloburls">supported</a>!',
					true);

			return;
		}

		inputNode.addEventListener('change', playSelectedFile, false);
	}(window));
</script>

</head>

<body>

	<section id="show-material" class="first">

		<table class="table">
			<tbody>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="material.name.label" default="Name" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: materialInstance, field: "name")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="material.description.label" default="Description" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: materialInstance, field: "description")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="material.author.label" default="Author" /></td>

					<td valign="top" class="value"><g:link controller="user"
							action="show" id="${materialInstance?.author?.id}">
							${materialInstance?.author?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="material.contentPath.label" default="Content Path" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: materialInstance, field: "contentPath")}
					</td>

				</tr>

				<tr class="prop">
					<div
						class="${hasErrors(bean: materialInstance, field: 'author', 'error')} ">
						<label for="author" class="control-label"><g:message
								code="material.author.label" default="Author" /></label>
						<div>
							<g:select class="form-control" id="author" name="author.id"
								from="${edu.dm.security.User.list()}" optionKey="id"
								value="${materialInstance?.author?.id}" class="many-to-one"
								noSelection="['null': '']" />
							<span class="help-inline">
								${hasErrors(bean: materialInstance, field: 'author', 'error')}
							</span>
						</div>
					</div>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="material.contentPath.label" default="Content Path" /></td>

					<td valign="top" class="value">
						<iframe width="560" height="315" src="//www.youtube.com/embed/e0WKJLovaZg" frameborder="0" allowfullscreen></iframe>		
					</td>

				</tr>
			


			</tbody>
		</table>

		<g:uploadForm controller="material" action="upload">
			<input type="file" name="myFile" />
			<input type="hidden" name="comp_id"
				value="${fieldValue(bean: materialInstance, field: "id")}" />

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary"
					value="${message(code: 'default.button.create.label', default: 'Upload content')}" />

			</div>
		</g:uploadForm>

	</section>

<div id="message"></div>
<input type="file" accept="video/*"/>
<video controls autoplay src="video/test.mp4" type='video/mp4'></video>

</body>

</html>
