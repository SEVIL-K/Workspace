package com.githrd.festival.util;
/*
    Created by HG on 2022-05-26
    
*/
public class PageUtil {
    private int nowPage = 1; //현재 보고있는 페이지
    private int totalCount; //총 게시물 수

    private int pageRow = 3; //한 페이지 당 보여줄 게시물 수
    private int pageGroup = 3; //한 화면당 이동가능한 페이지 수(밑 스크롤바)

    private int startPage; // 현제 페이지에서 보여줄 시작 페이지
    private int endPage; // 현제 페이지에서 보여줄 마지막 페이지

    private int startCont; // 현제 페이지에서 보여줄 시작 게시글의 rownum
    private int endCont; // 현제 페이지에서 보여줄 마지막 게시글의 rownum

    private int totalPage = 1; //총 페이지 수

    public PageUtil() {}
    public PageUtil(int nowPage, int totalCount){
        this(nowPage, totalCount, 3, 3);
    }
    public PageUtil(int nowPage, int totalCount, int pageRow, int pageGroup){
        this.nowPage = nowPage;
        this.totalCount = totalCount;
        this.pageRow = pageRow;
        this.pageGroup = pageGroup;

        setTotalPage();
        setStartPage();
        setEndPage();
        setCont();
    }

    // 총 페이지 수 계산하는 함수
    public void setTotalPage() {
        totalPage = (int) Math.ceil(totalCount * 1.0 / pageRow);

    }
    public void setStartPage() {
        int tmp = (int) Math.ceil(nowPage *1.0 / pageGroup);
        startPage = (tmp * pageGroup) - pageGroup + 1;

    }
    public void setEndPage() {
        int tmp = (int) Math.ceil(nowPage *1.0 / pageGroup);
        endPage = tmp * pageGroup;
        if (endPage > totalPage) {
            endPage = totalPage;
        }
    }

    public void setCont() {
        startCont = (nowPage - 1) * pageRow + 1;
        endCont = nowPage * pageRow;
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageRow() {
        return pageRow;
    }

    public void setPageRow(int pageRow) {
        this.pageRow = pageRow;
    }

    public int getPageGroup() {
        return pageGroup;
    }

    public void setPageGroup(int pageGroup) {
        this.pageGroup = pageGroup;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getStartCont() {
        return startCont;
    }

    public void setStartCont(int startCont) {
        this.startCont = startCont;
    }

    public int getEndCont() {
        return endCont;
    }

    public void setEndCont(int endCont) {
        this.endCont = endCont;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
