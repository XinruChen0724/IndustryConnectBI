select p.name, p.Id from [Keys].[dbo].[Property] p join [Keys].[dbo].[OwnerProperty] o on p.Id = o.PropertyId where o.OwnerId = 1426


select p.name, p.Id, v.Value from [Keys].[dbo].[Property] p join [Keys].[dbo].[OwnerProperty] o on p.Id = o.PropertyId join [Keys].[dbo].[PropertyHomeValue] v on v.PropertyId = p.Id join [Keys].[dbo].[PropertyHomeValueType] t on v.HomeValueTypeId = t.Id where o.OwnerId = 1426 and t.Id = 1


select p.name, p.Id, tenant.PaymentFrequencyId, f.Name, tenant.StartDate, tenant.EndDate, tenant.PaymentAmount, rental.Amount, CASE
	   WHEN f.name ='Weekly' THEN (DATEDIFF(week,tenant.StartDate, tenant.EndDate)*rental.Amount)
       WHEN f.name ='Fortnightly' THEN ((DATEDIFF(week,tenant.StartDate, tenant.EndDate)/2)*rental.Amount)
       ELSE (DATEDIFF(month,tenant.StartDate, tenant.EndDate)*rental.Amount) END as SumOfPayments from [Keys].[dbo].[Property] p join [Keys].[dbo].[OwnerProperty] o on p.Id = o.PropertyId join [Keys].[dbo].[TenantProperty] tenant on p.Id = tenant.PropertyId join [Keys].[dbo].[TenantPaymentFrequencies] f on tenant.PaymentFrequencyId = f.Id join [Keys].[dbo].[PropertyRentalPayment] rental on rental.PropertyId = p.Id where o.OwnerId = 1426 

select * from [Keys].[dbo].[Job] as j join [Keys].[dbo].[JobStatus] as js on js.Id = j.JobStatusId where js.Status = 'Open'

select p.name, p.Id, person.FirstName, person.LastName from [Keys].[dbo].[Property] p join [Keys].[dbo].[OwnerProperty] o on p.Id = o.PropertyId join [Keys].[dbo].[TenantProperty] tenant on p.Id = tenant.PropertyId join [Keys].[dbo].[Person] person on person.Id = tenant.tenantId where o.OwnerId = 1426 



