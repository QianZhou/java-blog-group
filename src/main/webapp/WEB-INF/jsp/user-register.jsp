<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user" cssClass="form-horizontal">
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label" >Name:</label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" placeholder="Name"/>
		</div>
	</div>

	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Email:</label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" placeholder="Email"/>
		</div>
	</div>


	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" placeholder="password" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" value="save" class="btn btn-lg btn" >Sign
				in</button>
		</div>
	</div>
</form:form>