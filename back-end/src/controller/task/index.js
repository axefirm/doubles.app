const { createtoken } = require('../../function/auth.js');

let ObjectId = require('mongodb').ObjectId;

const resolver = {
    Query: {
        getTasks: async function (root, args, context, info) {
            console.log(ObjectId(args.input.userId));
            return await context.db.collection('tasks').find({userId: ObjectId(args.input.userId)}).toArray();
        },
    },
    Mutation: {
        createTask: async function (root, args, context, info) {
            let search = await context.db.collection('user').findOne({_id: ObjectId(args.input.userId)});
            if (search) {
                args.input.userId = ObjectId(args.input.userId);
                await context.db.collection('tasks').insertOne(args.input);
                let response = { token: null }

                response.success = true;
                response.message =  "Ажилттай нэмэгдлээ.";
                
                return response;
            }else{
                return { success: false, message: "Хэрэглэгч олдсонгүй" }
            }
      
        },
        updateTask: async function (root, args, context, info) {
            await context.db.Testimonial.updateOne({_id: ObjectId(args.id)}, {$set: args.input});
            return {success: true, message: "Амжилттай шинэчлэгдлээ"};
        },
    }
};

module.exports.taskResolver = resolver;