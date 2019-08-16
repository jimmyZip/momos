package com.jimmyzip.momos.model.repository.branch;

import java.util.List;

import com.jimmyzip.momos.model.domain.branch.Branch;

public interface BranchDAO {
	public Branch select(int branch_id);
	public List<Branch> selectAll();
	public int insert(Branch branch);
	public Branch nameDoubleCheck(Branch branch);
	public int update(Branch branch);
	public int delete(int branch_id);
	public List<Branch> search(String searchWord);
}
