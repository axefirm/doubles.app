const { createtoken } = require('../../function/auth.js');

const resolver = {
    Query: {
        getStudents: async function (root, args, context, info) {
            return await context.db.collection('user').find().toArray();
        },
    },
    Mutation: {
        createStudent: async function (root, args, context, info) {
            args.input.email = args.input.email.replace(/\s/g, '');
            let search = await context.db.collection('user').findOne({email: args.input.email});
            if (!search) {
                await context.db.collection('user').insertOne(args.input);
                let response = { token: null }

                let token = await createtoken({ email: args.input.email, password: args.input.password, _id: args.input._id, tokenrole: "user" })
                response.token = token;
                response.success = true;
                response.message =  "Ажилттай үүслээ.";
                
                return response;
            }else{
                return { success: false, message: "Та манай системд бүртгэлтэй байна" }
            }
      
        },
        login: async function (root, args, context, info) {
            args.input.email = args.input.email.replace(/\s/g, '');
            let search = await context.db.collection('user').findOne(args.input);
            if (!search) {
                let search1 = await context.db.collection('user').findOne({ email: args.input.email });
                if (search1) return { success: false, message: "Та бичсэн имэйл болон нууц үгээ шалгаад ахин оролдоно уу!" };
                else return { success: false, message: "Та манай системд бүртгэлгүй байна" }
            }
            let response = { token: null }

            let token = await createtoken({ email: search.email, password: search.password, _id: search._id, tokenrole: "user" })
            let ret = await context.db.collection('user').findOne(args.input);
            
            delete ret.password;
            
            response.success = true;
            response.token = token;
            response.data = ret;
            console.log(response);
            return response;
        },
    }
};

module.exports.studentResolver = resolver;