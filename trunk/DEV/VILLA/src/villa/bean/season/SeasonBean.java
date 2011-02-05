package villa.bean.season;

import villa.service.season.SeasonService;

public class SeasonBean {
	private SeasonService m_seasonService;

	public SeasonService getSeasonService() {
		return m_seasonService;
	}

	public void setSeasonService(SeasonService seasonService) {
		this.m_seasonService = seasonService;
	}
}
