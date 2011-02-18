package villa.dto;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

@MappedSuperclass
public abstract class BaseDto implements Serializable {
	@Id @GeneratedValue
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
