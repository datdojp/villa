package villa.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="season")
public class SeasonDto extends BaseDto {
	@Column(name="begin_year")
	private int m_beginYear;
	
	@Column(name="end_year")
	private int m_endYear;
	
	public int getBeginYear() {
		return m_beginYear;
	}
	public void setBeginYear(int beginYear) {
		this.m_beginYear = beginYear;
	}
	public int getEndYear() {
		return m_endYear;
	}
	public void setEndYear(int endYear) {
		this.m_endYear = endYear;
	}
}
