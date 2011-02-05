package villa.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

public class BaseDto {
	@Id @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_STORE")
	@Column(name="id")
	private Integer m_id;
	
	@Version
	@Column(name="version")
	private Integer m_version;
	
	public Integer getId() {
		return m_id;
	}
	public void setId(Integer id) {
		this.m_id = id;
	}
	public Integer getVersion() {
		return m_version;
	}
	public void setVersion(Integer version) {
		this.m_version = version;
	}
}
