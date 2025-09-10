export default ({ env }) => ({
    upload: {
        config: {
            // https://www.npmjs.com/package/@strapi/provider-upload-aws-s3
            provider: 'aws-s3',
            providerOptions: {
                rootPath: 'media/',
                s3Options: {
                    credentials: {
                        accessKeyId: env('AWS_ACCESS_KEY_ID'),
                        secretAccessKey: env('AWS_ACCESS_SECRET'),
                    },
                    region: env('AWS_REGION'),
                    endpoint: env('AWS_ENDPOINT'),
                    params: {
                        ACL: env('AWS_ACL', 'public-read'),
                        Bucket: env('AWS_BUCKET'),
                    },
                    signatureVersion: 'v4',
                    // Для не-AWS провайдеров раскомментируйте:
                    forcePathStyle: true,
                },
                actionOptions: {
                    upload: {},
                    uploadStream: {},
                    delete: {},
                },
            },
        },
    },
    // ... other settings
});