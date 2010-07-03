<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>mvc-showcase</title>
</head>
<script type="text/javascript" src="<c:url value="/resources/jquery/jquery-1.4.2.js" />"></script>
<body>
<h1>mvc-showcase</h1>
<div id="simple">
	<h2>Simple</h2>
	<p>
		See the <code>org.springframework.samples.mvc.simple</code> package for the @Controller code
	</p>
	<ul>
		<li>
			<a href="<c:url value="/simple" />">GET /simple</a>
		</li>
		<li>
			<a id="simpleTextOnly" href="<c:url value="/simple/textonly" />">GET /simple/textonly</a> <span id="simpleTextOnlyResponse" class="responseMessage"></span>
			<script type="text/javascript">
				$("#simpleTextOnly").click(function(){
					$.ajax({ url: this.href, dataType: "text", success: function(text) {
							$("#simpleTextOnlyResponse").text("").fadeIn().text(text); 
						}
					});					
					return false;
				});
			</script>
		</li>
		<li>
			<a href="<c:url value="/simple/textonly" />">GET /simple/textonly</a> (Error due to wrong Accept header)	
		</li>
	</ul>
</div>
<div id="mapping">
	<h2>Mapping Requests</h2>
	<p>
		See the <code>org.springframework.samples.mvc.mapping</code> package for the @Controller code
	</p>
	<ul>
		<li>
			<a href="<c:url value="/mapping/path" />">By path</a>
		</li>
		<li>
			<a href="<c:url value="/mapping/method" />">By path and method</a>
		</li>
		<li>
			<a href="<c:url value="/mapping/parameter?foo=bar" />">By path, method, and presence of parameter</a>
		</li>
		<li>
			<a href="<c:url value="/mapping/parameter" />">By path, method, and not presence of parameter</a>
		</li>
		<li>
			<a id="mappingByHeader" href="<c:url value="/mapping/header" />">By presence of header</a> <span id="mappingByHeaderTextResponse" class="responseMessage"></span>
			<script type="text/javascript">
				$("#mappingByHeader").click(function(){
					$.ajax({ url: this.href, dataType: "text", success: function(text) {
							$("#mappingByHeaderTextResponse").text("").fadeIn().text(text); 
						}
					});					
					return false;
				});
			</script>
		</li>
		<li>
			<a id="mappingByHeaderNegation" href="<c:url value="/mapping/header" />">By not presence of header</a> <span id="mappingByHeaderNegationTextResponse" class="responseMessage"></span>			
			<script type="text/javascript">
				$("#mappingByHeaderNegation").click(function(){
					$.ajax({ url: this.href, dataType: "text",
						beforeSend: function(req) {
							req.setRequestHeader("Accept", "text/foo");
						}, 
						success: function(text) {
							$("#mappingByHeaderNegationTextResponse").text("").fadeIn().text(text); 
						}
					});					
					return false;
				});
			</script>
		</li>		
		<li>
			<a href="<c:url value="/mapping/wildcard" />">By regexp</a>
		</li>		
	</ul>
</div>
<div id="data">
	<h2>Obtaining Request Data</h2>
	<p>
		See the <code>org.springframework.samples.mvc.data</code> package for the @Controller code
	</p>
	<ul>
		<li>
			<a href="<c:url value="/data/param?foo=bar" />">Query parameter</a>
		</li>
		<li>
			<a href="<c:url value="/data/group?param1=foo&param2=bar&param3=baz" />">Group of query parameters</a>
		</li>
		<li>
			<a href="<c:url value="/data/path/foo" />">Path variable</a>
		</li>
		<li>
			<a href="<c:url value="/data/header" />">Header</a>
		</li>
		<li>
			<form id="requestBody" action="<c:url value="/data/body" />" method="post">
				<input type="submit" value="Request Body" /> <span id="requestBodyTextResponse" class="responseMessage"></span>		
			</form>
			<script type="text/javascript">
				$("form#requestBody").submit(function(){
					$.ajax({ type: "POST", url: this.action, data: "foo", contentType: "text/plain", dataType: "text",
						success: function(text) {
							$("#requestBodyTextResponse").text("").fadeIn().text(text); 
						}
					});					
					return false;
				});
			</script>
		</li>				
		<li>
			<form id="requestEntity" action="<c:url value="/data/entity" />" method="post">
				<input type="submit" value="Request Body and Headers" /> <span id="requestEntityTextResponse" class="responseMessage"></span>
			</form>
			<script type="text/javascript">
				$("form#requestEntity").submit(function(){
					$.ajax({ type: "POST", url: this.action, data: "foo", contentType: "text/plain", dataType: "text",
						success: function(text) {
							$("#requestEntityTextResponse").text("").fadeIn().text(text); 
						}
					});					
					return false;
				});
			</script>
		</li>
	</ul>	
	<div id="standardArgs">
		<h3>Standard Resolvable Web Arguments</h3>
		<ul>
			<li>
				<a href="<c:url value="/data/standard/request" />">Request arguments</a>					
			</li>
			<li>
				<form id="requestReader" action="<c:url value="/data/standard/request/reader" />" method="post">
					<input type="submit" value="Request Reader" /> <span id="requestReaderTextResponse" class="responseMessage"></span>		
				</form>
				<script type="text/javascript">
					$("form#requestReader").submit(function(){
						$.ajax({ type: "POST", url: this.action, data: "foo", contentType: "text/plain", dataType: "text",
							success: function(text) {
								$("#requestReaderTextResponse").text("").fadeIn().text(text); 
							}
						});					
						return false;
					});
				</script>
			</li>			
			<li>
				<form id="requestIs" action="<c:url value="/data/standard/request/is" />" method="post">
					<input type="submit" value="Request InputStream" /> <span id="requestIsTextResponse" class="responseMessage"></span>		
				</form>
				<script type="text/javascript">
					$("form#requestIs").submit(function(){
						$.ajax({ type: "POST", url: this.action, data: "foo", contentType: "text/plain", dataType: "text",
							success: function(text) {
								$("#requestIsTextResponse").text("").fadeIn().text(text); 
							}
						});					
						return false;
					});
				</script>
			</li>
			<li>
				<a href="<c:url value="/data/standard/response" />">Response arguments</a>					
			</li>			
			<li>
				<a href="<c:url value="/data/standard/response/writer" />">Response Writer</a>					
			</li>
			<li>
				<a href="<c:url value="/data/standard/response/os" />">Response OutputStream</a>					
			</li>
			<li>
				<a href="<c:url value="/data/standard/session" />">Session</a>					
			</li>			
		</ul>
	</div>
	<div id="customArgs">
		<h3>Custom Resolvable Web Arguments</h3>	
		<ul>
			<li>
				<a href="<c:url value="/data/custom" />">Custom</a>			
			</li>
		</ul>
	</div>
</div>
<div id="response">
	<h2>Writing Responses</h2>
	<ul>
		<li>
			<a href="<c:url value="/response/annotation" />">@ResponseBody</a>			
		</li>
		<li>
			<a href="<c:url value="/response/entity/status" />">ResponseEntity (custom status)</a>			
		</li>
		<li>
			<a href="<c:url value="/response/entity/headers" />">ResponseEntity (custom headers)</a>			
		</li>
	</ul>	
</div>
<div id="messageconverters">
	<h2>Http Message Converters</h2>
	<div id="stringMessageConverter">
		<h3>StringHttpMessageConverer</h3>
		<ul>
			<li>
				<form id="readString" action="<c:url value="/messageconverters/string" />" method="post">
					<input type="submit" value="Read a String" /> <span id="readStringResponse" class="responseMessage"></span>		
				</form>
				<script type="text/javascript">
					$("form#readString").submit(function(){
						$.ajax({ type: "POST", url: this.action, data: "foo", contentType: "text/plain", dataType: "text",
							success: function(text) {
								$("#readStringResponse").text("").fadeIn().text(text); 
							}
						});					
						return false;
					});
				</script>
			</li>
			<li>
				<a id="writeString" href="<c:url value="/messageconverters/string" />">Write a String</a> <span id="writeStringResponse" class="responseMessage"></span>
				<script type="text/javascript">
					$("#writeString").click(function(){
						$.ajax({ url: this.href, dataType: "text", success: function(text) {
								$("#writeStringResponse").text("").fadeIn().text(text); 
							}
						});					
						return false;
					});
				</script>								
			</li>
		</ul>
	</div>
</div>
<div id="views">

</div>
<div id="convert">

</div>
<div id="validation">

</div>
<div id="exceptions">

</div>
</body>
</html>