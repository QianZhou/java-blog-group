<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user"
	cssClass="form-horizontal registrationForm">

	<c:if test="${param.success eq true }">
		<div class="alert alter-success">Registration successful!!</div>
	</c:if>



	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" placeholder="Name" />
			<form:errors path="name" />

		</div>
	</div>

	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Email:</label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" placeholder="Email" />
			<form:errors path="email" />
		</div>
	</div>


	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control"
				placeholder="password" />
			<form:errors path="password" />

		</div>
	</div>


	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password
			again:</label>
		<div class="col-sm-10">
			<input type="password" name="password_again" id="password_again"
				class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" value="save" class="btn btn-lg btn">Sign
				in</button>
		</div>
	</div>
</form:form>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".registrationForm")
								.validate(
										{
											rules : {
												name : {
													required : true,
													minlength : 3,
													remote : {
														url : "<spring:url value='/register/available.html' />",
														type : "get",
														data : {
															username : function() {
																return $(
																		"#name")
																		.val();
															}
														}
													}
												},
												email : {
													required : true,
													email : true
												},
												password : {
													required : true,
													minlength : 5
												},
												password_again : {
													required : true,
													minlength : 5,
													equalTo : "#password"
												}
											},
											highlight : function(element) {
												$(element).closest(
														".form-group")
														.removeClass(
																"has-success")
														.addClass("has-error");
											},
											unhighlight : function(element) {
												$(element)
														.closest(".form-group")
														.removeClass(
																"has-error")
														.addClass("has-success");
											},
											messages:{
												name:{
													remote:"Such username already exists!"
												}
											}
											

										}

								);

					});
</script>