const { createtoken } = require('../../function/auth.js');

const resolver = {
    Query: {
        getStudents: async function (root, args, context, info) {
            return await context.db.collection('user').find().toArray();
        },
    },
    Mutation: {
        createStudent: async function (root, args, context, info) {
            await context.db.collection('user').insertOne(args.input);
            return { success: true, message: "Ажилттай үүслээ." };
        },
        login: async function (root, args, context, info) {
            args.input.email = args.input.email.replace(/\s/g, '');
            console.log(args.input)
            let search = await context.db.collection('user').findOne(args.input);
            if (!search) {
                let search1 = await context.db.collection('user').findOne({ email: args.input.email });
                if (search1) return { error: true, errormessage: "Та бичсэн имэйл болон нууц үгээ шалгаад ахин оролдоно уу!" };
                else return { error: true, errormessage: "Та манай системд бүртгэлгүй байна" }
            }
            let response = { token: null }

            let token = await createtoken({ email: search.email, password: search.password, _id: search._id, tokenrole: "user" })
            let ret = await context.db.collection('user').findOne(args.input);
            
            delete ret.password;

            response.token = token;
            response.data = ret;
            console.log(response);
            return response;
        },
    }
};

module.exports.studentResolver = resolver;