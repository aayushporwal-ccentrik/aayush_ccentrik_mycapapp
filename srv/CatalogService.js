 

module.exports = cds.service.impl(async function(){

    //it will look at our service.cds file and
    //get the object of corresponding entity so that 
    // we can tell CAPM which entity we want to add generic handler
    const{ EmployeeSet, POs} = this.entities;

    this.before(['UPDATE', 'CREATE'], EmployeeSet, (req, res)=>{
        console.log("I am here" + JSON.stringify(req.data))
        var jsonData = req.data;
        if(jsonData.hasOwnProperty("salaryAmount")){
            const salary = parseFloat(req.data.salaryAmount);
        if (salary > 1000000){
        req.error("500, tere aukaat ke bahar hai!");   
        }
        }
    });
// ncreasing everyone salary by 10%
    this.after('READ', EmployeeSet, (req,res)=>{
        console.log(JSON.stringify(req));
        var finalData = [];
        for(let i = 0; i< res.results.length; i++){
            const element =res.results[i];
            element.salaryAmount = element.salaryAmount * 1.10;
            finalData.push(element)
        }
        res.results.push({
            "ID":"dummy",
            "nameFirst": "ABC"
        })
        res.results = finalData;
    })

    //implementation of function
    this.on('getMostExpensiveOrder', async(req, res) => {
        try{
            const tx = cds.tx(req);

            const myData = await tx.read(POs)
            .where({GROSS_AMOUNT:{ '!=': null}})
            .orderBy({

            "GROSS_AMOUNT": 'desc'
        }).limit(1);

        return myData;
    }catch(error){
        return "Hey Buddy" + error.toString();
        }
    });

    //instance bound action 
    //The code below is written using CDS
    this.on('boost', async(req)=>{

        try {
           //programmiticaly check that whether the user have the Editor permission 
            req.user.is('Editor') || req.reject(403)
            const PO_ID = req.params[0];
            console.log('Bro your PO_ID was' + JSON.stringify(req.params));
            const tx = cds.tx(req);
           await tx.update(POs).with({
                "GROSS_AMOUNT": { '+=' : 2000 }
            }).where(PO_ID);
        //after modifying read the instance
        const reply = tx.read(POs).where(PO_ID);
        return reply;
        }
        catch{
            return 'Hey Buddy,' + error.toString();
        }


    })

})
