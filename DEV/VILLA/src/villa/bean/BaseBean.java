package villa.bean;

import java.util.List;

import villa.dto.SeasonDto;
import villa.service.season.SeasonService;

public class BaseBean {
	private SeasonService m_seasonService;
	public void setSeasonService(SeasonService seasonService) {
		this.m_seasonService = seasonService;
	}


	public List<SeasonDto> getAllSeasons() {
		return m_seasonService.getAllSeasons();
	}
}
