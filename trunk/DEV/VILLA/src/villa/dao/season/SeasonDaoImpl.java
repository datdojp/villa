package villa.dao.season;

import java.util.List;

import villa.dao.BaseDao;
import villa.dto.SeasonDto;

public class SeasonDaoImpl extends BaseDao implements SeasonDao {
	public List<SeasonDto> getAllSeasons() {
		return getHibernateTemplate().find("from season");
	}
	
}
