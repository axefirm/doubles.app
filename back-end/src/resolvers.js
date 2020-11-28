const resolvers = {
    Query: {
        getUsers: async function(root, args, context, info){
            return await context.db.collection('user').find().toArray();
          },
    },
    Mutation: {
        createUser: async function(root, args, context, info){
            await context.db.collection('user').insertOne(args.input);
            return {success: true, message: "Ажилттай үүслээ."};
          },
    }
};

module.exports.resolvers = resolvers;