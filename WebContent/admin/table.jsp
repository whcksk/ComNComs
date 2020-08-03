<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/admin/inc/header.jsp"%>
<div class="ui container segment">
	<table class="ui celled structured table">
  <thead>
    <tr>
      <th rowspan="2">Name</th>
      <th rowspan="2">Type</th>
      <th rowspan="2">Files</th>
      <th colspan="3">Languages</th>
    </tr>
    <tr>
      <th>Ruby</th>
      <th>JavaScript</th>
      <th>Python</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alpha Team</td>
      <td>Project 1</td>
      <td class="right aligned">2</td>
      <td class="center aligned">
        <i class="large green checkmark icon"></i>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td rowspan="3">Beta Team</td>
      <td>Project 1</td>
      <td class="right aligned">52</td>
      <td class="center aligned">
        <i class="large green checkmark icon"></i>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Project 2</td>
      <td class="right aligned">12</td>
      <td></td>
      <td class="center aligned">
        <i class="large green checkmark icon"></i>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Project 3</td>
      <td class="right aligned">21</td>
      <td class="center aligned">
        <i class="large green checkmark icon"></i>
      </td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>
<%@ include file="/admin/inc/footer.jsp"%>