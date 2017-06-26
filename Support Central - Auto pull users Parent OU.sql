DECLARE
    @CustomerId int=1,
    @ProviderId int=1,
    @OUId int=576,
    @Parent int=null,
    @ParentName varchar(50)=null,
    @parentnameoutput varchar(50)=null

    select @parent = ParentOUId
    from dbo.diagwin_OU
    Where 
    OUID = @OuId
    and CustomerId = @CustomerId
    and ProviderId = @ProviderId
/*All OUS not listed below*/
	select @ParentName = Name
    from DiagWin_OU
    where ouid = @Parent
	set @parentnameoutput = @ParentName
/*Superior Court*/	
if @parent in (402,404,456,461,574,577)
    begin
	select @ParentName = Name
    from DiagWin_OU
    where ouid = @Parent
	set @parentnameoutput = ('Subname1 ' + @ParentName)
		end
/*State Court*/
if @parent in (395,397,399,473,579)
    begin
	select @ParentName = Name
    from DiagWin_OU
    where ouid = @Parent
	set @parentnameoutput = ('Subname2 ' + @ParentName)
        END

/*Output time!*/
	select @ParentNameoutput 'ou'
