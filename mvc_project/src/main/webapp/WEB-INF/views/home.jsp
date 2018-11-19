<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<html>
<head>
<title>Home</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css?ver=2">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>


</head>

<body>


	<%-- <section>
		<h1>도서관</h1>
		<div>
			<form name="searchForm">
				<div>
				 <select name="searchType"
					class="form-control" style="width: 30%; display: inline-block;">

						<option value="n"
							<c:out value="${cri.searchType == null ? 'selected' : '' }"/>>---</option>
						<option value="a"
							<c:out value="${cri.searchType == 'a' ? 'selected' : '' }"/>>진영한빛도서관</option>
						<option value="b"
							<c:out value="${cri.searchType == 'b' ? 'selected' : '' }"/>selected>화정글샘도서관</option>
						<option value="c"
							<c:out value="${cri.searchType == 'c' ? 'selected' : '' }"/>>장유도서관</option>
						<option value="d"
							<c:out value="${cri.searchType == 'd' ? 'selected' : '' }"/>>칠암도서관</option>

				</select>
				<input type="text" class="form-control" id="keywordInput"
					style="width: 60%; display: inline-block;" name="keyword"
					value="${cri.keyword}" placeholder="검색어입력">

					<button id="searchBtn" type="button"style="width: 10%; display: inline-block;"
					 class="btn btn-warning">SEARCH</button>
				</div>
			</form>
		</div>
		<div id="bookresult" style="display:none">

			<table class="table">
				<thead class="thead-drak">
					<tr>
						<th>도서관위치</th>
						<th>책등록번호</th>
						<th>책제목</th>
						<th>저자</th>
						<th>출판사</th>
						<th>출판연도</th>
					</tr>
				</thead>
				<c:forEach var="bv" items="${list}">
					<tr>
						<td>${bv.location}</td>
						<td>${bv.bno}</td>
						<td>${bv.title}</td>
						<td>${bv.author}</td>
						<td>${bv.publisher}</td>
						<td>${bv.pubdate}</td>
					</tr>
				</c:forEach>
			</table>
		
		</div>
	</section> --%>
<section>

<img src="${pageContext.request.contextPath}/resources/img/02.jpg">

</section>


	<div class="col-6 col-md-3 sidebar-offcanvas" id="sidebar">
		<div class="list-group">
			<a href="#" class="list-group-item active">Link</a>
			<a href="/boardf/listFree" class="list-group-item">자유게시판</a>
			<a href="/test/boot_test01"	class="list-group-item">boot_test01</a>
			<a href="/test/boot_test02" class="list-group-item">boot_test02</a>
			<a href="/test/boot_test03" class="list-group-item">boot_test03</a>
			<a href="/test/boot_test04"	class="list-group-item">boot_test04</a>
			<a href="/test/boot_test05"	class="list-group-item">boot_test05</a>
			<a href="/test/boot_test06"	class="list-group-item">boot_test06</a>
			
			<a href="#" class="list-group-item">Link</a>
		</div>
	</div>



<div>

<img src="${pageContext.request.contextPath}/resources/img/03.jpg" style="width:1000px;height:550px;float:right;">
</div>

	<div class="container">
		<p>Far far away, behind the word mountains, far from the countries
			Vokalia and Consonantia, there live the blind texts. Separated they
			live in Bookmarksgrove right at the coast of the Semantics, a large
			language ocean. A small river named Duden flows by their place and
			supplies it with the necessary regelialia. It is a paradisematic
			country, in which roasted parts of sentences fly into your mouth.
			Even the all-powerful Pointing has no control about the blind texts
			it is an almost unorthographic life- -One day however a small line of
			blind text by the name of Lorem Ipsum decided to leave for the far
			World of Grammar. The Big Oxmox advised her not to do so, because
			there were thousands of bad Commas, wild Question Marks and devious
			Semikoli, but the Little Blind Text didn’t listen. She packed her
			seven versalia, put her initial into the belt and made herself on the
			way. When she reached the first hills of the Italic Mountains, she
			had a last view back on the skyline of her hometown Bookmarksgrove,
			the headline of Alphabet Village and the subline of her own road, the
			Line Lane. Pityful a rethoric question ran over her cheek, then</p>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-xs-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-xs-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-xs-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
		</div>
		<div class="row">
			<div class="col-sm-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-sm-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-sm-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-sm-3">
				<p class="text-primary">One morning, when Gregor Samsa woke from
					troubled dreams, he found himself transformed in his bed into a
					horrible vermin. He lay on his armour-like back, and if he lifted
					his head a little he could see his brown belly, slightly domed and
					divided by arches into stiff sections. The bedding was hardly able
					to cover it and seemed ready to slide off any moment. His many
					legs, pitifully thin compared with the size of the rest of him,
					waved about helplessly as he looked. "What's happened to me?" he
					thought. It wasn't a dream. His room, a proper human room although
					a little too small, lay peacefully between its four familiar walls.
					A collection of textile samples lay spread out on the table - Samsa
					was a travelling salesman - and above it there hung a picture that
					he had recently cut out of an illustrated magazine and housed in a
					nice, gilded frame. It showed a lady fitted out with a fur hat and
					fur boa who sat upright, raising a heavy fur muff that covered the
					whole of her lower arm towards the viewer. Gregor then turned to
					look out the window at the dull weather. Drops</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-md-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-md-33">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-md-3">
				<p class="text-success">One morning, when Gregor Samsa woke from
					troubled dreams, he found himself transformed in his bed into a
					horrible vermin. He lay on his armour-like back, and if he lifted
					his head a little he could see his brown belly, slightly domed and
					divided by arches into stiff sections. The bedding was hardly able
					to cover it and seemed ready to slide off any moment. His many
					legs, pitifully thin compared with the size of the rest of him,
					waved about helplessly as he looked. "What's happened to me?" he
					thought. It wasn't a dream. His room, a proper human room although
					a little too small, lay peacefully between its four familiar walls.
					A collection of textile samples lay spread out on the table - Samsa
					was a travelling salesman - and above it there hung a picture that
					he had recently cut out of an illustrated magazine and housed in a
					nice, gilded frame. It showed a lady fitted out with a fur hat and
					fur boa who sat upright, raising a heavy fur muff that covered the
					whole of her lower arm towards the viewer. Gregor then turned to
					look out the window at the dull weather. Drops</p>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-lg-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-lg-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
			<div class="col-lg-3">One morning, when Gregor Samsa woke from
				troubled dreams, he found himself transformed in his bed into a
				horrible vermin. He lay on his armour-like back, and if he lifted
				his head a little he could see his brown belly, slightly domed and
				divided by arches into stiff sections. The bedding was hardly able
				to cover it and seemed ready to slide off any moment. His many legs,
				pitifully thin compared with the size of the rest of him, waved
				about helplessly as he looked. "What's happened to me?" he thought.
				It wasn't a dream. His room, a proper human room although a little
				too small, lay peacefully between its four familiar walls. A
				collection of textile samples lay spread out on the table - Samsa
				was a travelling salesman - and above it there hung a picture that
				he had recently cut out of an illustrated magazine and housed in a
				nice, gilded frame. It showed a lady fitted out with a fur hat and
				fur boa who sat upright, raising a heavy fur muff that covered the
				whole of her lower arm towards the viewer. Gregor then turned to
				look out the window at the dull weather. Drops</div>
		</div>
	</div>


	<div class="container-fluid">
		<p class="text-primary">Far far away, behind the word mountains,
			far from the countries Vokalia and Consonantia, there live the blind
			texts. Separated they live in Bookmarksgrove right at the coast of
			the Semantics, a large language ocean. A small river named Duden
			flows by their place and supplies it with the necessary regelialia.
			It is a paradisematic country, in which roasted parts of sentences
			fly into your mouth. Even the all-powerful Pointing has no control
			about the blind texts it is an almost unorthographic life- -One day
			however a small line of blind text by the name of Lorem Ipsum decided
			to leave for the far World of Grammar. The Big Oxmox advised her not
			to do so, because there were thousands of bad Commas, wild Question
			Marks and devious Semikoli, but the Little Blind Text didn’t listen.
			She packed her seven versalia, put her initial into the belt and made
			herself on the way. When she reached the first hills of the Italic
			Mountains, she had a last view back on the skyline of her hometown
			Bookmarksgrove, the headline of Alphabet Village and the subline of
			her own road, the Line Lane. Pityful a rethoric question ran over her
			cheek, then</p>
	</div>
	<p class="text-success">Far far away, behind the word mountains,
		far from the countries Vokalia and Consonantia, there live the blind
		texts. Separated they live in Bookmarksgrove right at the coast of the
		Semantics, a large language ocean. A small river named Duden flows by
		their place and supplies it with the necessary regelialia. It is a
		paradisematic country, in which roasted parts of sentences fly into
		your mouth. Even the all-powerful Pointing has no control about the
		blind texts it is an almost unorthographic life- -One day however a
		small line of blind text by the name of Lorem Ipsum decided to leave
		for the far World of Grammar. The Big Oxmox advised her not to do so,
		because there were thousands of bad Commas, wild Question Marks and
		devious Semikoli, but the Little Blind Text didn’t listen. She packed
		her seven versalia, put her initial into the belt and made herself on
		the way. When she reached the first hills of the Italic Mountains, she
		had a last view back on the skyline of her hometown Bookmarksgrove,
		the headline of Alphabet Village and the subline of her own road, the
		Line Lane. Pityful a rethoric question ran over her cheek, then</p>

	<p class="text-info">Far far away, behind the word mountains, far
		from the countries Vokalia and Consonantia, there live the blind
		texts. Separated they live in Bookmarksgrove right at the coast of the
		Semantics, a large language ocean. A small river named Duden flows by
		their place and supplies it with the necessary regelialia. It is a
		paradisematic country, in which roasted parts of sentences fly into
		your mouth. Even the all-powerful Pointing has no control about the
		blind texts it is an almost unorthographic life- -One day however a
		small line of blind text by the name of Lorem Ipsum decided to leave
		for the far World of Grammar. The Big Oxmox advised her not to do so,
		because there were thousands of bad Commas, wild Question Marks and
		devious Semikoli, but the Little Blind Text didn’t listen. She packed
		her seven versalia, put her initial into the belt and made herself on
		the way. When she reached the first hills of the Italic Mountains, she
		had a last view back on the skyline of her hometown Bookmarksgrove,
		the headline of Alphabet Village and the subline of her own road, the
		Line Lane. Pityful a rethoric question ran over her cheek, then</p>

	<p class="text-danger">Far far away, behind the word mountains, far
		from the countries Vokalia and Consonantia, there live the blind
		texts. Separated they live in Bookmarksgrove right at the coast of the
		Semantics, a large language ocean. A small river named Duden flows by
		their place and supplies it with the necessary regelialia. It is a
		paradisematic country, in which roasted parts of sentences fly into
		your mouth. Even the all-powerful Pointing has no control about the
		blind texts it is an almost unorthographic life- -One day however a
		small line of blind text by the name of Lorem Ipsum decided to leave
		for the far World of Grammar. The Big Oxmox advised her not to do so,
		because there were thousands of bad Commas, wild Question Marks and
		devious Semikoli, but the Little Blind Text didn’t listen. She packed
		her seven versalia, put her initial into the belt and made herself on
		the way. When she reached the first hills of the Italic Mountains, she
		had a last view back on the skyline of her hometown Bookmarksgrove,
		the headline of Alphabet Village and the subline of her own road, the
		Line Lane. Pityful a rethoric question ran over her cheek, then</p>



	<!--/span-->
	</div>
	<!--/row-->

	<!-- <script>
  $.ajax({
    type :"GET"
    url:
  })
  
  
  
  </script> -->
	<footer>
		<%@include file="include/footer.jsp"%>
	</footer>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$('#searchBtn').click(
							function() {
								$('#bookresult').show();

								var search = $('#keywordInput').val();

								$.ajax({
									type : 'get',
									url : '/search/searchLib',
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "GET"
									},
									dataType : "text",
									data : JSON.stringify({
										search : search
									}),
									success : function(result) {
										if (result == "SUCCESS") {
											console.log("검색완료");
										}
									},

									error : function(request, status, error) {
										alert("code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}

								});

							});

				});
	</script>

</body>
</html>
