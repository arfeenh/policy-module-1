/*
 * This class is used to create claim objects.
 * Cliams are send to managers for approval.
 * @author					Patrick
 * @version      			1
 * @Class name				Claim
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

import java.util.Date;

public class Claim {
	private int claimId;
	private Date claimDate;
	private boolean isApproved;
	private int managerId;
	private String reasonForClaim;
	private String reasonForReject;
	private String proof;

	public int getClaimId() {
		return claimId;
	}

	public void setClaimId(int id) {
		this.claimId = id;
	}

	public Date getClaimDate() {
		return claimDate;
	}

	public void setClaimDate(Date date) {
		this.claimDate = date;
	}

	public boolean getStatus() {
		return isApproved;
	}

	public void setStatus(boolean status) {
		this.isApproved = status;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int id) {
		this.managerId = id;
	}

	public String getReasonForClaim() {
		return reasonForClaim;
	}

	public void setReasonForClaim(String reason) {
		this.reasonForClaim = reason;
	}

	public String getReasonForRejection() {
		return reasonForReject;
	}

	public void setReasonForRejection(String reason) {
		this.reasonForReject = reason;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}
}
