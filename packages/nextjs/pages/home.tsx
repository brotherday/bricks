import React from 'react'
import { Card, CardBody, CardFooter, Image, Stack, Heading, Text, Divider, Button, ButtonGroup ,CardHeader, SimpleGrid} from '@chakra-ui/react'
const home = () => {
    return (
        <div>
            <div className="flex items-center flex-col flex-grow pt-10">
                <div className="px-5">
                    <h1 className="text-center mb-8">
                        <span className="block text-2xl mb-2">Welcome to Bricks</span>
                        <span className="block text-4xl font-bold">The protocol to combine, fractionalize, and trade NFTs.</span>
                    </h1>
                    <p className="text-center text-lg">
                        Transform your NFT collection into a tradable asset with guaranteed liquidity
                    </p>
                </div>

                <div className="flex-grow bg-base-300 w-full mt-16 px-8 py-12">
                    <div className="flex justify-center items-center gap-20 flex-col sm:flex-row">
                        <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                            <p>
                                Buy and sell fractions of NFTs
                            </p>
                            <div>Explore Live Vaults</div>
                        </div>
                        <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                            <Card maxW='sm'>
                                <CardBody>
                                    <Image
                                        src='data:image/jpeg;base64,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'
                                        alt='Bored Ape'
                                        borderRadius='lg'
                                    />
                                    <Stack mt='6' spacing='3'>
                                        <Heading size='md'>Bored Ape</Heading>
                                        <Text>
                                            Bored Ape Yatch Club.
                                        </Text>
                                        <Text color='blue.600' fontSize='2xl'>
                                            $450
                                        </Text>
                                    </Stack>
                                </CardBody>
                            </Card>
                        </div>
                    </div>
                </div>
                <div className="px-5">
                    <h1 className="text-center mb-8">
                        <span className="block text-2xl pt-5 mb-2">Key Features</span>
                    </h1>
                    <p className="text-center text-lg">
                        Built by NFT collectors, Bricks brings a revolutionary and unique way to combine your NFT collection, tokenize it and make it tradable.
                    </p>
                    <SimpleGrid spacing={4} templateColumns='repeat(auto-fill, minmax(200px, 1fr))'>
                        <Card>
                            <CardHeader>
                                <Heading size='md'> Customer dashboard</Heading>
                            </CardHeader>
                            <CardBody>
                                <Text>View a summary of all your customers over the last month.</Text>
                            </CardBody>
                            <CardFooter>
                                <Button>View here</Button>
                            </CardFooter>
                        </Card>
                        <Card>
                            <CardHeader>
                                <Heading size='md'> Customer dashboard</Heading>
                            </CardHeader>
                            <CardBody>
                                <Text>View a summary of all your customers over the last month.</Text>
                            </CardBody>
                            <CardFooter>
                                <Button>View here</Button>
                            </CardFooter>
                        </Card>
                        <Card>
                            <CardHeader>
                                <Heading size='md'> Customer dashboard</Heading>
                            </CardHeader>
                            <CardBody>
                                <Text>View a summary of all your customers over the last month.</Text>
                            </CardBody>
                            <CardFooter>
                                <Button>View here</Button>
                            </CardFooter>
                        </Card>
                    </SimpleGrid>
                </div>
            </div>
        </div>
    )
}

export default home
