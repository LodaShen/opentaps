/*
 * Copyright (c) 2009 - 2009 Open Source Strategies, Inc.
 *
 * Opentaps is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Opentaps is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Opentaps.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.opentaps.search.party;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityOperator;
import org.opentaps.base.constants.RoleTypeConstants;
import org.opentaps.base.entities.PartyRole;
import org.opentaps.base.entities.PartyRolePk;
import org.opentaps.domain.party.Account;
import org.opentaps.domain.party.PartyRepositoryInterface;
import org.opentaps.domain.search.SearchDomainInterface;
import org.opentaps.domain.search.SearchRepositoryInterface;
import org.opentaps.domain.search.SearchResult;
import org.opentaps.domain.search.party.AccountSearchServiceInterface;
import org.opentaps.foundation.repository.RepositoryException;
import org.opentaps.foundation.service.ServiceException;
import org.opentaps.search.HibernateSearchService;

/**
 * The implementation of the Account search service.
 */
public class AccountSearchService extends HibernateSearchService implements AccountSearchServiceInterface {

    private List<Account> accounts = new ArrayList<Account>();

    /** {@inheritDoc} */
    public List<Account> getAccounts() {
        return accounts;
    }

    /** {@inheritDoc} */
    public String getQueryString() {
        StringBuilder sb = new StringBuilder();
        PartySearch.makePartyGroupQuery(sb, RoleTypeConstants.ACCOUNT);
        return sb.toString();
    }

    /** {@inheritDoc} */
    public Set<Class<?>> getClassesToQuery() {
        return PartySearch.PARTY_CLASSES;
    }

    /** {@inheritDoc} */
    public void search() throws ServiceException {
        try {
            SearchDomainInterface searchDomain = getDomainsDirectory().getSearchDomain();
            SearchRepositoryInterface searchRepository = searchDomain.getSearchRepository();
            search(searchRepository);
        } catch (RepositoryException e) {
            throw new ServiceException(e);
        }
    }

    /** {@inheritDoc} */
    public void readSearchResults(List<SearchResult> results) throws ServiceException {
        try {
            PartyRepositoryInterface partyRepository = getDomainsDirectory().getPartyDomain().getPartyRepository();
            // get the entities from the search results
            Set<String> accountIds = new HashSet<String>();
            for (SearchResult o : results) {
                Class<?> c = o.getResultClass();
                if (c.equals(PartyRole.class)) {
                    PartyRolePk pk = (PartyRolePk) o.getResultPk();
                    if (RoleTypeConstants.ACCOUNT.equals(pk.getRoleTypeId())) {
                        accountIds.add(pk.getPartyId());
                    }
                }
            }

            // apply pagination here
            setResultSize(accountIds.size());
            if (!accountIds.isEmpty() && getPageStart() < accountIds.size() && getPageSize() > 0) {
                accounts = partyRepository.findPage(Account.class, EntityCondition.makeCondition(Account.Fields.partyId.name(), EntityOperator.IN, accountIds), getPageStart(), getPageSize());
            } else {
                accounts = new ArrayList<Account>();
            }
        } catch (RepositoryException e) {
            throw new ServiceException(e);
        }
    }
}
