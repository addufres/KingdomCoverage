<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="partials/head.jsp"></jsp:include>

<body>
	<!-- navbar, page headers will go here -->
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	<div class="blended_grid">
		<div class="topBanner">
			<br>
			<div class="fancyBox">
				<h1 class="companyName">Kingdom Coverage</h1>
				<h4 class="script">
					<em>Kingdom has the coverage if you have the coin...</em>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="feedHost col-md-8">
				<!-- Verification of request for coverage being submitted -->
				<c:if test="${! empty updateMessage}">
					<div class="feed">
						<br>
						<h3>${updateMessage}</h3>
					</div>
				</c:if>
				<div class="feed">
					<br>
					<h1>Agent ${agent.fName}'s Profile</h1>
				</div>
				<div class="feed">
					<br>
					<h3>Clients:</h3>
					<c:choose>
						<c:when test="${empty agent.clients}">
							<h3>No clients to display at this time. Get selling!!</h3>
						</c:when>
						<c:otherwise>
							<c:forEach var="c" items="${agent.clients}">
								<a href="getClient.do?id=${c.id}">${c.fName} ${c.lName}</a>
								<br>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<br>
				</div>
			</div>

			<div class="feed formTextLight rightColumn col-md-4">
				<table>
					<thead>
						<tr>
							<td><h3 class="companyName">Inbox:</h3></td>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td>
								<form action="composedMessageFromInsured.do" method="POST">
									<button type="button" class="pressed btn btn-info btn-lg"
										data-toggle="modal" data-target="#myModalCompose"
										style="margin: 1em 1em 1em 1em;">&#9998 Compose
										Message</button>

									<!-- Modal -->
									<div id="myModalCompose" class="modal fade" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">Share a message with your
														agent:</h4>
												</div>
												<div class="modal-body">

													<textarea rows="4" cols="50" name="messageBody"
														placeholder="Type your message here..."></textarea>
													<input type="submit" class="pressed btn btn-warning"
														value="Send &#x00A; &#x2709">
												</div>
												<div class="modal-footer">
													<button type="button" class="pressed btn btn-default"
														data-dismiss="modal">Back</button>
												</div>
											</div>

										</div>
									</div>
								</form>
							</td>
						</tr>
						<tr>
							<td>
							<c:choose>
									<c:when test="${inbox == 'null'}">
											You have no messages in your inbox.
									</c:when>
									<c:otherwise>
										<c:choose>
												<c:when test="${inbox.toString() == 'n'}">
													<!-- Can put this part into another div box for "sent" -->

													<%-- To: ${m.agent.fName} ${m.agent.lName}<br>
											From: ${m.insured.fName} ${m.insured.lName}<br> --%>
												</c:when>
												<c:otherwise>
													Message Id: ${inbox.id}<br>
													To: ${inbox.agent.fName} ${inbox.agent.lName}<br>
													From: ${inbox.insured.fName} ${inbox.insured.lName}<br>
													Message: ${inbox.messageBody}<br>
												</c:otherwise>
											</c:choose>
											<br>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<td><h3 class="companyName">Sent Mail:</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><c:choose>
									<c:when test="${sent == 'null'}">
										You have not sent any messages yet.
									</c:when>
									<c:otherwise>
											<c:choose>
												<c:when test="${sent.toString() == 'n'}">
											
											Message Id: ${sent.id}<br>
											To: ${sent.insured.fName} ${sent.insured.lName}<br>
											From: ${sent.agent.fName} ${sent.agent.lName}<br>
											Message: ${sent.messageBody}<br>
												</c:when>
												<c:otherwise>

													<%-- To: ${m.insured.fName} ${m.insured.lName}<br>
											From: ${m.agent.fName} ${m.agent.lName}<br> --%>
												</c:otherwise>
											</c:choose>
											<br>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</tbody>
						<form action="agentMessages.do" , method="GET">
						<input type="submit" class="gimmeRoom btn btn-link"
							value="Messages">
						</form>
				</table>
			</div>
		</div>
		<div class="row"></div>
	</div>
	<jsp:include page="partials/foot.jsp"></jsp:include>
</body>
</html>