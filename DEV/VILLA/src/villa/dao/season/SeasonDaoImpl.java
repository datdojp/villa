package villa.dao.season;

import java.util.ArrayList;
import java.util.List;

import villa.dao.BaseDao;
import villa.dto.SeasonDto;

public class SeasonDaoImpl extends BaseDao implements SeasonDao {
	public List<SeasonDto> getAllSeasons() {
//		return getHibernateTemplate().find("from season");
		List<SeasonDto> result = new ArrayList<SeasonDto>();
		SeasonDto aSeason = new SeasonDto();
		aSeason.setBeginYear(2010);
		aSeason.setEndYear(2011);
		result.add(aSeason);
		return result;
	}
	
}
