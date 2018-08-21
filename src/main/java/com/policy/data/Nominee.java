/*
 * This class is used to create Nominee objects.
 * Nominees are bounded to policies and customers.
 * @author					Patrick
 * @version      			1
 * @Class name				Nominee
 * @Creation Date			August 14, 2018
 * @History
 * @Reviewed by & Status	Patrick
 */

package com.policy.data;

public class Nominee {
	private int nomineeId;
	private String nomineeName;
	private String relationshipToCustomer;
	private String purposeOfChanged;
	
	public int getNomineeId() {
		return nomineeId;
	}

	public void setNomineeId(int id) {
		this.nomineeId = id;
	}

	public String getNomineeName() {
		return nomineeName;
	}

	public void setNomineeName(String name) {
		this.nomineeName = name;
	}

	public String getRelationshipToCustomer() {
		return relationshipToCustomer;
	}

	public void setRelationshipToCustomer(String relationship) {
		this.relationshipToCustomer = relationship;
	}

	public String getPurposeOfChanged() {
		return purposeOfChanged;
	}

	public void setPurposeOfChanged(String purpose) {
		this.purposeOfChanged = purpose;
	}
}
