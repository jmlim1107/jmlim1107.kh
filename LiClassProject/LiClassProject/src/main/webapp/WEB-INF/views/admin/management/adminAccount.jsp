<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="container">
    <h1>관리자 계정 관리</h1>
    <hr />
    <div class="row justify-content">
        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
            <div class="card mb-3">

                <div class="card-body">

                    <div class="pt-4 pb-2">
                        <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                        <p class="text-center small">Enter your personal details to create account</p>
                    </div>

                    <form class="row g-3 needs-validation" novalidate="">
                        <div class="col-12">
                            <label for="yourName" class="form-label">관리자 아이디</label>
                            <input type="text" name="name" class="form-control" id="yourName" required="" disabled value="${}">
                            <div class="invalid-feedback">Please, enter your name!</div>
                        </div>

                        <div class="col-12">
                            <label for="yourEmail" class="form-label">비밀번호</label>
                            <input type="email" name="email" class="form-control" id="yourEmail" required="">
                            <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                        </div>

                        <div class="col-12">
                            <label for="yourUsername" class="form-label">관리자 이름</label>
                            <div class="input-group has-validation">
                                <input type="text" name="username" class="form-control" id="yourUsername" required="">
                                <div class="invalid-feedback">Please choose a username.</div>
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="yourPassword" class="form-label">관리자 등급</label>
                            <input type="password" name="password" class="form-control" id="yourPassword" required="">
                            <div class="invalid-feedback">Please enter your password!</div>
                        </div>

                        <div class="col-12">
                            <button class="btn btn-primary w-100" type="submit">저장하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>