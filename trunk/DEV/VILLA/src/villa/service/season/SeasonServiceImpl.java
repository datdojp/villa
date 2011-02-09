package villa.service.season;

import java.util.List;
import villa.dao.season.SeasonDao;
import villa.dto.SeasonDto;
import villa.service.BaseService;

public class SeasonServiceImpl extends BaseService implements SeasonService {
	private SeasonDao m_seasonDao;
	public void setSeasonDao(SeasonDao seasonDao) {
		this.m_seasonDao = seasonDao;
	}

	@Override
	public List<SeasonDto> getAllSeasons() {
		return m_seasonDao.getAllSeasons();
	}
}
