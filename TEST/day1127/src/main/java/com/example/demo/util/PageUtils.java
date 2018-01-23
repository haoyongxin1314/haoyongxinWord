package com.example.demo.util;

public class PageUtils {

	private int currentPage;
	private int pageSize;
	private int totalCount;
	private int totalPage;
	private int prevPage;
	private int nextPage;
	private int startIndex;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public PageUtils(String page, int allCount, int pageSize) {
		this.getCpage(page);
		this.totalCount = allCount;
		this.pageSize = pageSize;
		this.getPrev();
		this.getAllpage();
		this.getNext();
		this.getStart();
	}

	public void getCpage(String page) {
		if (page == null || page == "") {
			this.currentPage = 1;
		} else {
			this.currentPage = Integer.parseInt(page);
		}

	}

	private void getAllpage() {

		this.totalPage = (this.totalCount / this.pageSize) + ((this.totalCount % this.pageSize) == 0 ? 0 : 1);

	}

	private void getPrev() {
		if (this.currentPage == 1) {
			this.prevPage = 1;
		} else {
			this.prevPage = this.currentPage - 1;
		}
	}

	private void getNext() {
		if (this.currentPage == this.totalPage) {
			this.nextPage = this.totalPage;
		} else {
			this.nextPage = this.currentPage + 1;
		}
	}

	private void getStart() {
		this.startIndex = (this.currentPage - 1) * this.pageSize;

	}

}
