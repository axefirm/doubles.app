const resolvers = {
    Query: {
        hello: () => "hello"
    },
    Mutation: {
        createUser: async function(root, args, context, info){
            await context.db.collection('user').insertOne(args.input);
            return {success: true, message: "Ажилттай үүслээ."};
          },
    }
};

module.exports.resolvers = resolvers;