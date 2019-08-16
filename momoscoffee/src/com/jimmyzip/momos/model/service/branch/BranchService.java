package com.jimmyzip.momos.model.service.branch;

import java.util.List;

import com.jimmyzip.momos.model.domain.branch.Branch;
import com.jimmyzip.momos.model.domain.branch.BranchImage;

public interface BranchService {
	public Branch select(int branch_id);
	public List<Branch> selectAll();
	public void insert(Branch branch,BranchImage branchImage,String path);
	public Branch nameDoubleCheck(Branch branch);
	public void update(Branch branch,BranchImage branchImage,String path);
	public void delete(List<Integer> deleteArray,String path);
	public List<Branch> search(String searchWord);
	public List<BranchImage> getImg();
}
