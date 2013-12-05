class AccountObject < DataObject

#  include Navigation
#  include DateFactory
  include StringFactory

  attr_accessor :description, :chart_code, :number, :name, :org_cd, :campus_cd, :effective_date,
                :postal_cd, :city, :state, :address,
                :type_cd, :sub_fnd_group_cd, :higher_ed_funct_cd, :restricted_status_cd,
                :fo_principal_name, :supervisor_principal_name, :manager_principal_name,
                :budget_record_level_cd, :sufficient_funds_cd,
                :expense_guideline_text, :income_guideline_txt, :purpose_text

  def initialize(browser, opts={})
    @browser = browser

    defaults = {
        description:          random_alphanums(40, 'AFT'),
        chart_code:           'BL', #TODO grab this from config file
        number:               random_alphanums(7),
        name:                 random_alphanums(10),
        org_cd:               'BI',
        campus_cd:            'BL', #TODO grab this from config file
        effective_date:       '01/01/2010',
        postal_cd:            '14853',
        city:                 'Ithaca',
        state:                'NY',
        address:              'Cornell University',
        type_cd:              'NA',
        sub_fnd_group_cd:     'GENFND',
        higher_ed_funct_cd:   'IN',
        restricted_status_cd: 'U',
        fo_principal_name:    'jguillor',
        supervisor_principal_name:  'jaraujo',
        manager_principal_name: 'warriaga',
        budget_record_level_cd: 'C',
        sufficient_funds_cd:    'C',
        expense_guideline_text: 'expense guideline text',
        income_guideline_txt:   'incomde guideline text',
        purpose_text:           'purpose text'
    }
    set_options(defaults.merge(opts))
  end

  def create
    visit(MainPage).account
    on(AccountLookup).create
    on AccountPage do |page|
      page.expand_all
      page.description.fit @description
      page.chart_code.fit @chart_code
      page.number.fit @account_number
      page.name.fit @name
      page.org_cd.fit @org_cd
      page.campus_cd.fit @campus_cd
      page.effective_date.fit @effective_date
      page.postal_cd.fit @postal_cs
      page.city.fit @city
      page.state.fit @state
      page.address.fit @address
      page.type_cd.fit @type_cd
      page.sub_fnd_group_cd.fit @sub_fnd_group_cd
      page.higher_ed_funct_cd.fit @higher_ed_funct_cd
      page.restricted_status_cd.fit @restricted_status_cd
      page.fo_principal_name.fit @fo_principal_name
      page.supervisor_principal_name.fit @supervisor_principal_name
      page.manager_principal_name.fit @manager_principal_name
      page.budget_record_level_cd.fit @budget_record_level_cd
      page.sufficient_funds_cd.fit @sufficient_funds_cd
      page.expense_guideline_text.fit @expense_guideline_text
      page.income_guideline_txt.fit @income_guideline_txt
      page.purpose_text.fit @purpose_text
    end
  end
end