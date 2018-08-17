/*
 * Created by Patrick Yu on Aug 14, 2018
 */

package com.policy.data;

import java.util.Date;

public class Claim {
	private int claim_id;
	private Date claim_date;
	private boolean is_approved;
	private int manager_id;
	private String reason_for_claim;
	private String reason_for_rejection;
	private String proof;

	public int getClaimId() {
		return claim_id;
	}

	public void setClaimId(int id) {
		this.claim_id = id;
	}

	public Date getClaimDate() {
		return claim_date;
	}

	public void setClaimDate(Date date) {
		this.claim_date = date;
	}

	public boolean getStatus() {
		return is_approved;
	}

	public void setStatus(boolean status) {
		this.is_approved = status;
	}

	public int getManagerId() {
		return manager_id;
	}

	public void setManagerId(int id) {
		this.manager_id = id;
	}

	public String getReasonForClaim() {
		return reason_for_claim;
	}

	public void setReasonForClaim(String reason) {
		this.reason_for_claim = reason;
	}

	public String getReasonForRejection() {
		return reason_for_rejection;
	}

	public void setReasonForRejection(String reason) {
		this.reason_for_rejection = reason;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}
}
