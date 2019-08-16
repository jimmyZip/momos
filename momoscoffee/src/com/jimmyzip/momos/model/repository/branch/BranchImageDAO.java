package com.jimmyzip.momos.model.repository.branch;

import java.util.List;

import com.jimmyzip.momos.model.domain.branch.BranchImage;

public interface BranchImageDAO {
	public BranchImage select(int branch_image_id);
	public List<BranchImage> selectAll();
	public List<BranchImage> selectAllByFk(int branch_id);
	public int insert(BranchImage branchImage);
	public int update(BranchImage branchImage);
	public int updateFile(BranchImage branchImage);
	public int deleteAllByFk(int branch_id);
	public int deleteFile(BranchImage branchImage);
	public List<BranchImage> search(String searchWord);
}
