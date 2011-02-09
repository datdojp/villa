package villa.bean.season;

import java.util.List;
import villa.bean.BaseBean;
import villa.dto.SeasonDto;
import villa.service.season.SeasonService;

public class SeasonBean extends BaseBean {
	private SeasonService m_seasonService;

	public SeasonService getSeasonService() {
		return m_seasonService;
	}

	public void setSeasonService(SeasonService seasonService) {
		this.m_seasonService = seasonService;
	}
	
	public List<SeasonDto> getAllSeasons() {
		return m_seasonService.getAllSeasons();
	}
	
	public SeasonDto getASeason() {
		return m_seasonService.getAllSeasons().get(0);
	}
	
	public String getSomething() {
		return "This is a static text";
	}
}
