const resolvers = {
    Query: {
        hello: () => "hello"
    },
    Mutation: {
        createUser: async function(root, args, context, info){
            console.log(context.db.user);
            await context.db.user.insertOne(args.input);
            return {success: true, message: "Ажилттай үүслээ."};
          },
    }
};

module.exports.resolvers = resolvers;